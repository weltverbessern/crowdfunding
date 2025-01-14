module CrowdfundingHelper
  def share_link_facebook
    raw "<a href='https://www.facebook.com/sharer.php?u=#{encoded_root_url}'>Facebook</a>"
  end
  def share_link_pinterest
    image_url = URI.encode_www_form_component t('crowdfunding.share.share_image_url')
    share_text = URI.encode_www_form_component t('crowdfunding.share.share_text')
    raw "<a href='https://pinterest.com/pin/create/bookmarklet/?media=#{image_url}&url=#{encoded_root_url}&description=#{share_text}'>Pinterest</a>"
  end
  def share_link_twitter
    share_text = URI.encode_www_form_component t('crowdfunding.share.share_text')
    raw "<a href='https://twitter.com/share?url=#{encoded_root_url}&text=#{share_text}'>Twitter</a>"
  end

  def encoded_root_url
    raw URI.encode_www_form_component "#{request.scheme}://#{request.host}/"
  end

  def sold_out(incentive)
    incentive.limit > -1 and order_count(incentive) >= incentive.limit
  end

  def order_count(incentive)
    Order.where(
      'incentive_id = ? and (payment_status = ? or payment_status = ?)',
      incentive,
      'completed',
      'processing'
    ).count
  end
end
