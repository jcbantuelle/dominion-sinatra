class KingdomCardIndex

  AVAILABLE_CARDS = %w(adventurer bureaucrat cellar chancellor chapel council_room feast festival gardens laboratory library market militia mine moat moneylender remodel smithy spy thief throne_room village witch woodcutter workshop)

  class << self

    def starting_cards
      AVAILABLE_CARDS.shuffle.take(10)
    end

  end
end

# Intrigue
#cards = %w(courtyard pawn secret_chamber great_hall masquerade shanty_town steward swindler wishing_well baron bridge conspirator coppersmith ironworks mining_village scout duke minion saboteur torturer trading_post tribute upgrade harem nobles)

# Seaside
#cards = %w(embargo haven lighthouse native_village pearl_diver fishing_village caravan cutpurse sea_hag treasure_map bazaar merchant_ship outpost tactician wharf)
# ambassador lookout smugglers warehouse island navigator pirate_ship salvager explorer ghost_ship treasury
#create_cards(cards, true, false, false, 'seaside')

# Alchemy
#cards = %w(transmute vineyard apothecary herbalist scrying_pool university alchemist familiar philosophers_stone golem apprentice)
# possession

#
# Promo
#cards = %w(envoy walled_village governor)
# black_market stash
#
# Prosperity
#cards = %w(loan trade_route watchtower bishop monument quarry talisman workers_village city contraband counting_house mint mountebank rabble royal_seal vault venture goons grand_market hoard bank expand forge kings_court peddler)

#
# Cornucopia
#cards = %w(hamlet fortune_teller menagerie farming_village horse_traders remake tournament young_witch harvest horn_of_plenty hunting_party jester fairgrounds)

#
# Hinterlands
#cards = %w(crossroads duchess fools_gold develop oasis oracle nomad_camp silk_road cache highway ill_gotten_gains scheme tunnel jack_of_all_trades noble_brigand spice_merchant trader cartographer embassy haggler inn mandarin margrave stables border_village farmland)

# Dark Ages
#cards = %w(poor_house vagrant sage bandit_camp rats death_cart marauder beggar squire forager hermit market_square storeroom urchin armory feodum fortress ironmonger procession scavenger band_of_misfits wandering_minstrel catacombs count counterfeit cultist graverobber junk_dealer mystic pillage rebuild rogue altar hunting_grounds knights)

# Knights
#cards = %w(dame_anna dame_josephine dame_molly dame_natalie dame_sylvia sir_martin sir_bailey sir_destry sir_michael sir_vander)

# Guilds
# cards = %w(candlestick_maker stonemason doctor masterpiece advisor herald plaza taxman baker butcher journeyman merchant_guild soothsayer)
# create_cards(cards, true, false, false, 'guilds')
