# frozen_string_literal: true

class CpblPlayerContext
  def initialize(order_by = nil, desc = 'y', hitter = 'y')
    @order_by = order_by
    @desc = desc
    @relation = CpblPlayer
    @hitter = hitter
  end

  def perform
    scope_by_default
    order_by_params
  end

  def scope_by_default
    @relation = @relation.
                 joins(join_table).
                 where(primary_stat_type: @hitter == 'y' ? 'batting' : 'pitching').
                 group('cpbl_players.id, cpbl_teams.tricode, baseball_positions.code').
                 select(@hitter == 'y' ? scope_by_hitter : scope_by_pitcher)
  end

  def order_by_params
    return @relation if @order_by.nil? || @hitter != 'y'

    if @desc == 'n' && @hitter == 'y'
      @relation = @relation.sort_by { |player| player.send(@order_by.to_sym) }
    else
      @relation = @relation.sort_by { |player| player.send(@order_by.to_sym) }.reverse
    end
  end

  def join_table
    if @hitter == 'y'
      %i[cpbl_hitting_game_logs cpbl_teams primary_position]
    else
      %i[cpbl_pitching_game_logs cpbl_teams primary_position]
    end
  end

  def scope_by_hitter
    <<-SQL.squish
      cpbl_players.*,
      cpbl_teams.tricode,
      baseball_positions.code,
      count(*) AS g,
      SUM(cpbl_hitting_game_logs.ab) AS ab,
      SUM(cpbl_hitting_game_logs.r) AS r,
      SUM(cpbl_hitting_game_logs.h) AS h,
      SUM(cpbl_hitting_game_logs.d) AS d,
      SUM(cpbl_hitting_game_logs.t) AS t,
      SUM(cpbl_hitting_game_logs.hr) AS hr,
      SUM(cpbl_hitting_game_logs.rbi) AS rbi,
      SUM(cpbl_hitting_game_logs.bb) AS bb,
      SUM(cpbl_hitting_game_logs.so) AS so,
      SUM(cpbl_hitting_game_logs.hbp) AS hbp,
      SUM(cpbl_hitting_game_logs.sf) AS sf,
      SUM(cpbl_hitting_game_logs.sb) AS sb
    SQL
  end

  def scope_by_pitcher
    <<-SQL.squish
      cpbl_players.*,
      cpbl_teams.tricode,
      baseball_positions.code,
      count(*) AS g,
      SUM(cpbl_pitching_game_logs.ip) AS ip,
      SUM(cpbl_pitching_game_logs.r) AS r,
      SUM(cpbl_pitching_game_logs.h) AS h,
      SUM(cpbl_pitching_game_logs.er) AS er,
      SUM(cpbl_pitching_game_logs.bb) AS bb,
      SUM(cpbl_pitching_game_logs.so) AS so,
      SUM(cpbl_pitching_game_logs.hr) AS hr
    SQL
  end
end
