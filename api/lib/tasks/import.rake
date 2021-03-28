namespace :import do
  # card.delete_all
  # edition.delete_all

  def import_edition_and_cards file_name
    file = File.read(Rails.root.join('lib/tasks/data/cards/', file_name))
    data_hash = JSON.parse(file)
    edition_data = {
      name: data_hash['data']['name'],
      released_at: data_hash['data']['releaseDate']
    }

    edition = Edition.create(edition_data)
    cards = data_hash['data']['cards']

    cards.each do |card|
      card_data = {
        edition: edition,
        description: card['text'],
        power: card['power'],
        thoughness: card['toughness'],
        loyalty: card['loyalty'],
        flavor_text: card['flavorText'],
        name: card['name'],
        mana_cost: card['manaCost'],
        subtype: card['subtypes'],
        supertype: card['supertypes'],
        color: card['colors'],
        card_type: card['types']
      }

      Card.create(card_data)
    end
  end

  desc "TODO"
  task cards: :environment do
    Card.delete_all
    Edition.delete_all
    files = Dir.entries(Rails.root.join('lib/tasks/data/cards'))

    files.each do |file| 
      next if file == '.' || file == '..'

      import_edition_and_cards file
    end
  end

end
