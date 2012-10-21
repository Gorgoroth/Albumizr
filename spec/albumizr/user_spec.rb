require 'spec_helper'

module Albumizr
  describe User do
    let(:user) { User.new(name: "John") }

    subject { user }

    it { should respond_to(:name) }
    it { should be_valid }
  end
end