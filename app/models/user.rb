class User < ApplicationRecord
  # VALID_EMAIL_REGEX= /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  # validates :email , presence: true, uniqueness:{case_sensetive:false}, format:{with:VALID_EMAIL_REGEX, multiline:true}  

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
