require "rails_helper"

RSpec.describe RecordsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/records").to route_to("records#index")
    end

    it "routes to #show" do
      expect(get: "/records/1").to route_to("records#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/records").to route_to("records#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/records/1").to route_to("records#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/records/1").to route_to("records#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/records/1").to route_to("records#destroy", id: "1")
    end
  end
end
