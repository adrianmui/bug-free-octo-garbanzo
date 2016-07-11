require 'battle_bot'

#weapon.rb
class Weapon

  attr_accessor :bot
  attr_reader :name, :damage

  def initialize(name, damage=nil)

    @bot = nil
    
  
    @name =  name
    
    @damage = damage

    if @name.class != String
      raise ArgumentError 
    end
    if @damage.class != Fixnum && @damage != nil
      raise ArgumentError 
    end
  end

  def bot=(bot)
    if bot.class != BattleBot || bot != nil
      raise ArgumentError
    end

    @bot = bot
  end

  def name=(str)
      raise NoMethodError, "no method"
  end

  def damage=(str)
    raise NoMethodError, "no method"
  end

  def bot
    nil
  end

  def picked_up?
    if pick_up(weapon)
      true
    end
    false
  end

end