require_relative 'battle_bot'

#weapon.rb
class Weapon
  attr_reader :name, :damage, :bot

  def initialize(name, damage=nil)    
    @bot = nil
    @name =  name
    @damage = damage

    raise ArgumentError if @name.class != String
    raise ArgumentError if @damage.class != Fixnum && @damage != nil
  end

  def bot=(a_bot)
    @bot = a_bot
    raise ArgumentError if a_bot.class != BattleBot unless a_bot == nil
    
  end

  def name=(str)
      raise NoMethodError, "no method"
  end

  def damage=(str)
    raise NoMethodError, "no method"
  end

  def picked_up?
    !!@bot 
  end

end