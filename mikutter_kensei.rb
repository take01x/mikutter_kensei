# -*- coding: utf-8 -*-

Plugin.create(:mikutter_kensei) do
  command(
          :mikutter_kensei,
          name: '牽制',
          condition: lambda{ |opt| true },
          visible: true,
          role: :timeline
          ) do |opt|
    opt.messages.map{ |m|
      user_name = m.message.user.idname
      message = "@" + user_name + " すぐに人を殺すの良くない（牽制）"
      message += '　' * (rand(140-message.split(//).size+1)+1)
      Service.primary.post(:message => message,
                           :replyto => m.message)
    }
  end
end

