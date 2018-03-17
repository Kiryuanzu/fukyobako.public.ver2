class User < ApplicationRecord
  validates :username, presence: true, length: { maximum: 12 }
  validates :email, presence: true, length: { maximum: 255 }
  has_many :odais, :dependent => :destroy
  has_many :fukyos, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :fukyo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter]
  has_attached_file :avatar, styles: { medium: "100×100>", thumb: "100x100>"}
  validates_attachment_content_type :avatar, content_type: ["image/jpg","image/jpeg","image/png"]


   def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.new(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        username: auth.info.name
      )
      user.skip_confirmation!
      user.save
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
