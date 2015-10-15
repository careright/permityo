require 'spec_helper.rb'

RSpec.describe User, type: :model do
  # For boolean fields on models, ActiveRecord defines the field? method.
  # This is a quick and easy way to give roles using boolean flags on your model.
  # Don't forget to mark the fields as attr_protected.
  describe "for boolean fields on the user" do
    it "should have a role if the flag set to true" do
      expect(User.new(:admin => true)).to have_role('admin')
    end

    it "should not have a role if the flag set to false" do
      expect(User.new(:admin => false)).not_to have_role("admin")
    end
  end

  # For anything more dynamic than a boolean field you can simply
  # define a method.
  describe "for methods on the user" do
    it "should have a role if the method returns true" do
      expect(User.new).to have_role("dogooder")
    end

    it "should have a role if the method returns an object" do
      expect(User.new).to have_role("returns_symbol")
    end

    it "should not have a role if the method returns false" do
      expect(User.new).not_to have_role("doeviler")
    end

    it "should not have a role if the method returns nil" do
      expect(User.new).not_to have_role("returns_nil")
    end
  end
end
