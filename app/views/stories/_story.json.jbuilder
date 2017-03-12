json.extract! story, :id, :headline, :subtitle, :body, :created_at, :updated_at
json.url story_url(story, format: :json)
