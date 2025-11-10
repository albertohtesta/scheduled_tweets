class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, length: { minimum: 1, maximum: 280 }
  validates :publish_at, presence: true
  after_initialize do
    self.publish_at ||= 24.hours.from_now
  end

  # after_save_commit do
  #   if publish_at_previously_changed?
  #     TweetJob.set(wait_until: publish_at).perform_later(self)
  #   end
  # end

  def published?
    tweet_id?
  end

  # def publish_to_twitter!
  #   tweet = twitter_account.client.post("tweets", "{\"text\":\"#{body}\"}")
  #   update(tweet_id: tweet["data"]["id"])
  # end

  def publish_to_twitter!
    # 1. Creamos el payload como un Hash de Ruby
    payload = {
      text: body
    }

    # 2. La gema 'x' se encarga de convertirlo a JSON y añadir la cabecera correcta.
    # El segundo argumento debe ser el objeto (Hash) o una cadena JSON CON la cabecera
    # Content-Type especificada (aunque pasar el Hash es mejor práctica).

    # tweet = twitter_account.client.post("tweets", payload)

#    Si te da error con el Hash, usa la opción explícita (menos limpia, pero funciona):
    tweet = twitter_account.client.post(
      "tweets",
      payload.to_json,
      content_type: "application/json" # <--- ESTO ES CRUCIAL
    )

    update!(tweet_id: tweet["data"]["id"])
  end
end
