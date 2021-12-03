class JobOfferSlipsController < ApplicationController
  def create
    # TODO: 全く同じタイトルと募集内容の募集を作成しない
    JobOfferSlip.create!(
      corporate_id: offer_params[:corporate_id],
      title: offer_params[:title],
      content: offer_params[:content],
      tag: tag,
      displayed: true
    )
  end

  private

  def offer_params
    params.permit(:title, :content, :tag, :corporate_id)
  end
end
