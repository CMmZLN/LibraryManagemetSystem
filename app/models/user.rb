class User < ApplicationRecord

    has_one_attached :profile_image
    has_many :borrow_requests
    
    # For Name
    validates :name , presence: { message: "を入力してください。"}

    # For Email
    # validates :email, email: true, :uniqueness =>  true 

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates :email, presence: { message: "を入力してください。"}
    validates :email,
    format: {with: VALID_EMAIL_REGEX,message: "を正しいフォマードで入力してください。"},
            if: -> {email.present?}

    # For Password
    validates :password, presence: { message: "を入力してください。"}
    validates :password,length: {minimum: 8,message: "は8 文字以上である必要があります。"} ,if: -> {password.present?}

    validates :password, format: { 
        with: /\A.*(?=.*\d)(?=.*[!@#$%^&>]).*\z/,
        message: 'が少なくとも 1 つの数字と 1 つの特殊文字を含める必要がある。' }, if: -> {password.present? && password.length >= 8}

    # For Phone Number
    validates :tel, presence: { message: "を入力してください。"}
    validates_format_of :tel, 
        :with => /\(?[0-9]{3}\)?-[0-9]{4}-[0-9]{4}/,
        :message => " を正しいフォマードで入力してください。列:000-0000-0000", if: -> {tel.present?}


    # For Role Number
    validates :roll_no, presence: { message: "を入力してください。"}, uniqueness: {case_sensitive: false, message: "は、すでに使われています."}
    validates_format_of :roll_no, 
        :with => /\A[Cc][Mm]{2}_\d{3}\z/,
        :message => "を正しいフォマードで入力してください。列:CMM_000", 
        if: -> {roll_no.present?}

    # For Profile Image
    validate :validate_image_extension
    private
    def validate_image_extension
      if profile_image.attached? && !valid_image_extension?
        errors.add(:profile_image, " はjpg、png、jpegである必要があります。")
      end
    end
    
    def valid_image_extension?
      return false unless profile_image.attached?
      allowed_extensions = %w(.jpg .jpeg .png ) # Add more extensions as needed
      allowed_extensions.include?(File.extname(profile_image.filename.to_s).downcase)
    end

    def self.search(search)
      if search 
        where("acc_type =?", "学生").where('name LIKE :search OR roll_no LIKE :search ', search: "%#{search}%")
      else 
        where("acc_type =?", "学生")
      end

     end
    # validate :correctImageType, if: -> { profile_image.present? }
    # ALLOWED_MIME_TYPES = %w(image/jpg image/jpeg image/png).freeze

    # private
    # def correctImageType
    #     if !self.profile_image.blob.content_type.in?(ALLOWED_MIME_TYPES)
    #         Rails.logger.info("Model")
    #         Rails.logger.info(self.profile_image)
    #       errors.add(:profile_image, "はjpg、png、jpegである必要があります。")
    #     end
    # end


end

 

    

    

    
    