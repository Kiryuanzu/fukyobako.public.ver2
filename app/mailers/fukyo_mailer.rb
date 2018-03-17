class FukyoMailer < ApplicationMailer
	default from: 'from@fukyobako.com'

	def fukyo_notify(fukyo)
	  @fukyo = fukyo
	  @user = fukyo.odai.user
	  @odai = fukyo.odai
	  mail(to: @user.email, subject: '[布教箱]あなたのお題に布教がつきました')
	end
end
