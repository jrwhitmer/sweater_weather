require 'rails_helper'

RSpec.describe ImageSearch do
  it 'exits' do
      results =  {
          "id": 9034999,
          "width": 6535,
          "height": 4357,
          "url": "https://www.pexels.com/photo/man-and-woman-having-a-discussion-9034999/",
          "photographer": "RODNAE Productions",
          "photographer_url": "https://www.pexels.com/@rodnae-prod",
          "photographer_id": 3149039,
          "avg_color": "#6E6761",
          "src": {
              "original": "https://images.pexels.com/photos/9034999/pexels-photo-9034999.jpeg",
              "large2x": "https://images.pexels.com/photos/9034999/pexels-photo-9034999.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
              "large": "https://images.pexels.com/photos/9034999/pexels-photo-9034999.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
              "medium": "https://images.pexels.com/photos/9034999/pexels-photo-9034999.jpeg?auto=compress&cs=tinysrgb&h=350",
              "small": "https://images.pexels.com/photos/9034999/pexels-photo-9034999.jpeg?auto=compress&cs=tinysrgb&h=130",
              "portrait": "https://images.pexels.com/photos/9034999/pexels-photo-9034999.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
              "landscape": "https://images.pexels.com/photos/9034999/pexels-photo-9034999.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
              "tiny": "https://images.pexels.com/photos/9034999/pexels-photo-9034999.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
            }
          }
      image_search = ImageSearch.new(results)

      expect(image_search).to be_an(ImageSearch)
  end

  it 'has attributes' do
    results =  {
        "id": 9034999,
        "width": 6535,
        "height": 4357,
        "url": "https://www.pexels.com/photo/man-and-woman-having-a-discussion-9034999/",
        "photographer": "RODNAE Productions",
        "photographer_url": "https://www.pexels.com/@rodnae-prod",
        "photographer_id": 3149039,
        "avg_color": "#6E6761",
        "src": {
            "original": "https://images.pexels.com/photos/9034999/pexels-photo-9034999.jpeg",
            "large2x": "https://images.pexels.com/photos/9034999/pexels-photo-9034999.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            "large": "https://images.pexels.com/photos/9034999/pexels-photo-9034999.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
            "medium": "https://images.pexels.com/photos/9034999/pexels-photo-9034999.jpeg?auto=compress&cs=tinysrgb&h=350",
            "small": "https://images.pexels.com/photos/9034999/pexels-photo-9034999.jpeg?auto=compress&cs=tinysrgb&h=130",
            "portrait": "https://images.pexels.com/photos/9034999/pexels-photo-9034999.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
            "landscape": "https://images.pexels.com/photos/9034999/pexels-photo-9034999.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
            "tiny": "https://images.pexels.com/photos/9034999/pexels-photo-9034999.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
          }
        }
    image_search = ImageSearch.new(results)

    expect(image_search.image_url).to eq("https://www.pexels.com/photo/man-and-woman-having-a-discussion-9034999/")
    expect(image_search.photographer).to eq("RODNAE Productions")
    expect(image_search.photographer_url).to eq("https://www.pexels.com/@rodnae-prod")
  end
end
