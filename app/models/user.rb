class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        has_many	:gigs
        has_many	:proposals
        has_many	:edus
        has_many	:resumes
        has_many	:companies
end
