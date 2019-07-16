require 'rails_helper'

describe "Users Testing" do
    it "gets all users" do
        get '/users'
        json = JSON.parse(response.body)
    
        # Assure that we got a successful response
        expect(response).to be_success
    
        # test that response has some data
        expect(json.length).not_to eq 2
      end
    
      it "searches for a user by any value" do
        get "/users/query?name=root"
        json = JSON.parse(response.body)
    
        # Assure that we got a successful response
        expect(response).to be_success
    
        # test that response has some data
        expect(json.length).not_to eq 2
      end

      it "searches for a user by UID" do
        get "/users/1001"
        json = JSON.parse(response.body)
    
        # Assure that we got a successful response
        expect(response).to be_success
    
        # test that response has some data
        expect(json.length).not_to eq 2
      end

      it "searches for a user by UID and returns fail message" do
        get "/users/222"
        json = JSON.parse(response.body)
    
        # Assure that we got a successful response
        expect(response).to be_success
    
        # test that response has some data
        expect(json.length).not_to eq 2
      end

      it "searches for the group corresponding to User UID" do
        get "/users/1001/groups"
        json = JSON.parse(response.body)
    
        # Assure that we got a successful response
        expect(response).to be_success
    
        # test that response has some data
        expect(json.length).not_to eq 2
      end
end
