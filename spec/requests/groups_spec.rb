require 'rails_helper'

describe "Groups Testing" do
    it "gets all groups" do
        get '/groups'
        json = JSON.parse(response.body)
    
        # Assure that we got a successful response
        expect(response).to be_success
    
        # test that response has some data
        expect(json.length).not_to eq 2
      end

      it "searches for a group by any value" do
        get "/groups/query?name=_analyticsusers&gid=250"
        json = JSON.parse(response.body)
    
        # Assure that we got a successful response
        expect(response).to be_success
    
        # test that response has some data
        expect(json.length).not_to eq 2
      end

      it "searches for a group by GID" do
        get "/groups/250"
        json = JSON.parse(response.body)
    
        # Assure that we got a successful response
        expect(response).to be_success
    
        # test that response has some data
        expect(json.length).not_to eq 2
      end

      it "searches for a group by GID and returns fail message" do
        get "/groups/2"
        json = JSON.parse(response.body)
    
        # Assure that we got a successful response
        expect(response).to be_success
    
        # test that response has some data
        expect(json.length).not_to eq 2
      end
end
