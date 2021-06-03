json.extract! shortened_url, :id, :target, :short_form, :user, :visit_count, :created_at, :updated_at
json.url shortened_url_url(shortened_url, format: :json)
