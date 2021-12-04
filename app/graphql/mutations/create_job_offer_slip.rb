module Mutations
  class CreateJobOfferSlip < BaseMutation
    field :job_offer_slip, Types::JobOfferSlipType, null: false

    argument :title, String, required: true
    argument :content, String, required: true
    argument :tag, String, required: false
    argument :logined, Boolean, required: true
    argument :token, String, required: true

    def resolve(**offer_params)
      # MEMO: ログインしてないと作成できないようにする
      return unless offer_params[:logined] && offer_params[:token]

      user = User.find_by(token: offer_params[:token])
      corporate = Corporate.find_or_create_by!(user_id: user.id)
      return unless user

      job_offer_slip = JobOfferSlip.create!(
        corporate_id: corporate.id,
        title: offer_params[:title],
        content: offer_params[:content],
        tag: offer_params[:tag] == 'null' || offer_params[:tag] == 'undefined' ? '' : offer_params[:tag],
        displayed: true
      )

      return unless JobOfferSlip

      PostBosyuContentToTwitterJob.perform_later(job_offer_slip)
      { job_offer_slip: job_offer_slip }
    end
  end
end
