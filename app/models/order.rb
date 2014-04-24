class Order < ActiveRecord::Base
  # associations
  has_many :line_items, dependent: :destroy

  validates :feedback_type, presence: true
   # exclusion: { in: "Select From Below",
   #  message: "Please choose one of the options from the drop down." }

  # validations shipping
  validates :first_name_ship, :last_name_ship, :address1_ship, :city_ship, :state_ship, :zipcode_ship, presence: true
  validates :zipcode_ship, length: { in: 5..12 }

  # validations billing
  validates :first_name_bill, :last_name_bill, :address1_bill, :city_bill, :state_bill, :zipcode_bill, presence: true
  validates :zipcode_bill, length: { in: 5..12 }

  #validations customer contact
  validates :email, :phone_number, presence: true

  #validates email
  validates :email, :confirmation => true
  validates :email_confirmation, :presence => true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "You entered an invalid email"}


  #validations totals
  validates :subtotal, :tax, :shipping, :grand_total, presence: true

  # validations booleans
  validates :is_residential_ship, inclusion: [true, false]




  # before actions
  before_save :titleize_params
  before_save :strip_phone_number

  # scopes
  scope :fresh, -> { where(status: 'new') }
  # couldnt name the scope new
  scope :processing, -> { where(status: 'processing') }
  scope :shipped, -> { where(status: 'shipped') }
  scope :declined, -> { where(status: 'declined') }
  scope :returned, -> { where(status: 'returned') }

  # methods
  def add_line_items_from_cart(shopping_cart)
    shopping_cart.line_items.each do |line_item|
      line_item.cart_id = nil
      line_items << line_item
    end
  end


  def titleize_params
     self.first_name_ship = first_name_ship.titleize
     self.last_name_ship = last_name_ship.titleize
     self.address1_ship = address1_ship.titleize
     self.address2_ship = address2_ship.titleize
     self.city_ship = city_ship.titleize

     self.first_name_bill = first_name_bill.titleize
     self.last_name_bill = last_name_bill.titleize
     self.address1_bill = address1_bill.titleize
     self.address2_bill = address2_bill.titleize
     self.city_bill = city_bill.titleize

     self.email = email.downcase

  end

  def strip_phone_number
    self.phone_number = phone_number.gsub(/[^0-9]/, "")
  end

  def save_with_payment(stripe_token, grand_total_cents, email)
    # check if object is valid
    if valid?
        # use gem to make payment
        Stripe.api_key = "sk_test_epYHN93uqwj2aFBWXWoXK9bY"
        charge = Stripe::Charge.create(
            :amount => grand_total_cents, # amount in cents, again
            :currency => "usd",
            :card => stripe_token,
            :description => email
        )
        save!
    end

    rescue Stripe::CardError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end

end
