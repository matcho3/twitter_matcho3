class User < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
	has_secure_password
	validates :password, length: { minimum: 6 }

	has_many :tweets
	def set_image(file)
		if !file.nil?
			file_name = file.original_filename
			File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file.read)}
			self.image = file_name
		end
	end
end


# email が存在すること。
# 正規表現にひっかかっているか否か。
# presence 値が入っているか調べる。
# uniqueness true 重複した場合にエラーを返す。

# class User < ActiveRecord::Base
# 	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
# 	validates :email,presence: true, format:


# 【課題】 Userモデルのnameに、
# ・値が入ってること
# ・文字の長さが５０字以内
# の２つのバリデーションを加えてください。
# app/models/user.rb

