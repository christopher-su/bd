class TeamMember < ActiveRecord::Base
  validates :name , :presence => true , :uniqueness => true
  attr_reader :password
  validate :password_must_be_present

  def TeamMember.encrypt_password(password,salt)
    Digest::SHA2.hexdigest(password+"brosis"+salt)
  end

  def TeamMember.authenticate(name,password)
    if team_member = find_by_name(name)
      if team_member.hashed_pwd = encrypt_password(password,team_member.salt)
        team_member
      end
    end
  end

  def password=(password)
    @password = password
    if password.present?
      generate_salt
      self.hashed_pwd = self.class.encrypt_password(password,salt)
    end
  end

  private
  def password_must_be_present
    errors.add(:password,"Missing password") unless hashed_pwd.present?
  end

  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end


end
