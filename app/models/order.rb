class Order < ActiveRecord::Base
  before_validation :generate_uuid!, :on => :create
  belongs_to :user
  belongs_to :incentive
  self.primary_key = 'uuid'

  def self.generate
    o = self.new
    o.order_number = Order.next_order_number || 1
    o
  end

  def self.next_order_number
    if Order.count > 0
      Order.order("order_number DESC").limit(1).first.order_number.to_i + 1
    else
      1
    end
  end

  def generate_uuid!
    begin
      self.uuid = SecureRandom.hex(16)
    end while Order.find_by(:uuid => self.uuid).present?
  end

  def self.goal
    Settings.project_goal
  end

  def self.percent
    (Order.revenue.to_f / Order.goal.to_f) * 100.to_f
  end

  def self.backers
    Order.count
  end

  def self.revenue
    if Incentive.exists?
      Incentive.joins(:orders).where(
        'payment_status = ? or payment_status = ?',
        'completed',
        'processing'
      ).pluck('sum(amount)')[0].to_f
    else
      Order.sum(:price).to_f
    end 
  end

  validates_presence_of :product_name, :price, :user_id
end
