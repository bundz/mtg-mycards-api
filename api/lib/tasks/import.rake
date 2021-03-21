namespace :import do
  desc "TODO"
  task cards: :environment do
    file = File.read(Rails.root.join('lib/tasks/data/TSR.json'))
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
        description: "#{card['text']} | #{card['power']}/#{card['toughness']}",
        flavor_text: card['flavorText'],
        name: card['name'],
        mana_cost: card['manaCost'],
        subtype: card['subtypes'].join(' '),
        supertype: card['supertypes'].join(' '),
        color: card['colors'].join(''),
        card_type: card['types'].join(' ')
      }

      Card.create(card_data)
    end

  end

end
