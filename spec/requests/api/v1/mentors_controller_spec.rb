require 'rails_helper'

RSpec.describe "Api::V1::Mentors", type: :request do
    let!(:mentor1) { Mentor.create!(first_name:'Anna', last_name:'Smith', email:'anna@example.com')}
    let!(:mentor2) { Mentor.create!(first_name: 'Alex',last_name:'Smith', email:'alex@example.com')}

    #Test the list route
    describe 'GET /mentors' do
        it 'returns a list of mentors' do
            get '/mentors'
            expect(response).to have_http_status(:ok)
            expect(response.body).to include("Anna", "Alex")
            expect(response.body).to include("Smith")
            expect(response.body).to include("anna@example.com", "alex@example.com")
        end
    end
    #Test the show route

    describe "GET /mentors/:id" do
        it "returns a single mentor by id" do
            get "/mentors/#{mentor1.id}" 

            expect(response).to have_http_status(:ok)
            expect(response.body).to include("Anna")
            expect(response.body).to include("Smith")
            expect(response.body).to include("anna@example.com")
        end
    end
end


