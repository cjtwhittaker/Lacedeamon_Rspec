require 'spec_helper'
require 'HTTParty'
describe 'Add items' do 


  describe 'HTTParty rubygem' do
    item =  HTTParty.post 'http://lacedeamon.spartaglobal.com/todos', query:{title: 'Post 1', due: '2015-02-26' }
    url = "http://lacedeamon.spartaglobal.com/todos/#{item['id'].to_s}"
    it 'should be able to add an item to the list' do
      expect(item.code).to eq(201)
    end

    it 'shoudl be able to read the item from a list' do
      expect((HTTParty.get url).code).to eq(200)
    end
    
    it 'should be able to delete a post' do
      delete = HTTParty.delete url
      expect(delete.code).to eq(204)
      puts delete.message
      expect(delete.message).to eq('No Content')
    end
    #slight problem here in that it relies on the post actually being created correctly in the first place, therefore they will all need to be run together 
  end
 

#    HTTParty.delete @url
    
end

#to delete all posts
# all = HTTParty.get 'http://lacedeamon.spartaglobal.com/todos'
# all.each do |v|
#   HTTParty.delete "http://lacedeamon.spartaglobal.com/todos/#{v['id'].to_s}"
# end
