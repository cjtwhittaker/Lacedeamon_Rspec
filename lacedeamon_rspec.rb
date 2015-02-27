require 'spec_helper'

describe 'HTTParty rubygem' do

    it 'should be able to add an item to the list' do
      item =  HTTParty.post 'http://lacedeamon.spartaglobal.com/todos', query:{title: 'Post 1', due: '2015-02-26' }
      expect(item.class).to be_a(HTTParty::Response)
    end
    
end