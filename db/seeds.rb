# frozen_string_literal: true

def create_hitter
  team = CpblTeam.create(city: '桃園', full_name: 'Lamigo', tricode: '')
  hitter = CpblPlayer.create(number: 52,
                             name: '陳金鋒',
                             primary_stat_type: 'batting',
                             bats: 'R',
                             throws: 'R',
                             status: 0)

  CpblTeamPlayer.create(cpbl_team: team, cpbl_player: hitter)

  BaseballHittingStat.create(year: 2016,
                             g: 91,
                             ab: 344,
                             pa: 398,
                             r: 76,
                             h: 109,
                             d: 21,
                             t: 0,
                             hr: 21,
                             rbi: 81,
                             sb: 20,
                             tb: 193,
                             so: 72,
                             bb: 36,
                             ibb: 8,
                             hbp: 5,
                             ao: 87,
                             go: 81,
                             gidp: 8,
                             sf: 5, sac: 0, cs: 1,
                             player: hitter)
end

def create_pitcher
  team = CpblTeam.create(city: '台南', full_name: '統一7-ELEVEn', tricode: '')

  pitcher = CpblPlayer.create(number: 18,
                              name: '潘威倫',
                              primary_stat_type: 'pitching',
                              bats: 'R',
                              throws: 'R',
                              status: 0)

  CpblTeamPlayer.create(cpbl_team: team, cpbl_player: pitcher)

  BaseballPitchingStat.create(year: 2016,
                              g: 13,
                              ip: 52.1,
                              gs: 8,
                              gr: 5,
                              cg: 0,
                              sho: 0,
                              nbb: 0,
                              bf: 233,
                              np: 779,
                              w: 5,
                              l: 2,
                              sv: 0,
                              bs: 1,
                              hld: 1,
                              h: 76,
                              hr: 4,
                              bb: 3,
                              ibb: 0,
                              hbp: 1,
                              so: 23,
                              wp: 1,
                              bk: 0,
                              r: 36,
                              er: 31,
                              go: 67,
                              ao: 63,
                              player: pitcher)
end

if Rails.env.development?
  if CpblPlayer.count.zero?
    create_hitter
    create_pitcher
  end
end
