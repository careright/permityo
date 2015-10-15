require 'spec_helper.rb'

# Here you see that normal ActiveRecord x-to-one and x-to-many relationships provide
# out of the box authorization, which is especially suitable for when your authorization
# scheme is already expressed in your model tier.

RSpec.describe Group, type: :model do
  describe "for x-to-one relationships" do
    it "should have a role if the user is that relationship" do
      expect(Group.new(:owner => (u = User.new)).accepts_role?("owner", u)).to be_truthy
    end

    it "should not have a role if the user is not that relationship" do
      expect(Group.new(:owner => User.new).accepts_role?("owner", User.new)).to be_falsy
    end
  end

  describe "for x-to-many relationships" do
    it "should have a role if the user is in that relationship" do
      g = Group.new
      g.members << (u = User.new)
      expect(g.accepts_role?("member", u)).to be_truthy
    end

    it "should not have a role if the user is not in that relationship" do
      g = Group.new
      g.members << User.new
      expect(g.accepts_role?("member", User.new)).to be_falsy
    end
  end
end
