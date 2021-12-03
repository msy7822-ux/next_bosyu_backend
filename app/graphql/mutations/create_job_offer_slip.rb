module Mutations
  class CreateJobOfferSlip < BaseMutation
    field :job_offer_slip, Types::JobOfferSlipType, null: false

    argument :title, String, required: true
    argument :content, String, required: true
    argument :tag, String, required: false
    argument :logined, Boolean, required: true

    def resolve(**offer_params)
      # MEMO: ログインしてないと作成できないようにする
      return unless offer_params[:logined]

      job_offer_slip = JobOfferSlip.create!(
        # corporate_id: offer_params[:corporate_id],
        corporate_id: Corporate.first.id,
        title: offer_params[:title],
        content: offer_params[:content],
        tag: offer_params[:tag],
        displayed: true
      )

      return unless JobOfferSlip

      PostBosyuContentToTwitterJob.perform_later(job_offer_slip)
      { job_offer_slip: job_offer_slip }
    end
  end
end
