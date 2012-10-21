require 'spec_helper'

module Albumizr
  describe User do

    before { @user = User.new( name: "User", password: "123456", password_confirmation: "123456") }
    subject { @user }

    it { should respond_to(:name) }
    it { should respond_to(:authenticate) }
    it { should be_valid }

    describe "rejects name if blank" do
      before { @user.name = " " }
      it { should_not be_valid }
    end

    describe "rejects name if already taken" do
      before {
        duplicate = @user.dup
        duplicate.save
      }
      it { should_not be_valid }
    end

    describe "rejects name if too short" do
      before { @user.name = "a" * (2-1) }
      it { should_not be_valid }
    end

    describe "rejects name if too long" do
      before { @user.name = "a" * (42+1) }
      it { should_not be_valid }
    end


    describe "rejects password if blank" do
      before { @user.password = " " }
      it { should_not be_valid }
    end

    describe "rejects password if too short" do
      before { @user.password = "a" * (6-1) }
      it { should_not be_valid }
    end

    describe "rejects password confirmation if blank" do
      before { @user.password_confirmation = " " }
      it { should_not be_valid }
    end


  end
end