require 'spec_helper'

describe ReviewsHelper, :type => :helper do
  it 'is passive if there is no number' do
    expect(helper.star_rating('N/A')).to eq 'N/A'
  end

  it 'it gives 5 stars for a 5 rating' do
    expect(helper.star_rating(5)).to eq '★★★★★'
  end

  it "returns three black stars and two white stars for three" do
    expect(helper.star_rating(3)). to eq '★★★☆☆'
  end

  it "returns four black stars and one white star for 3.5" do
    expect(helper.star_rating(3.5)). to eq '★★★★☆'
  end
end