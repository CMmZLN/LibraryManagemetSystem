class LoginsController < ApplicationController

  def login
    # @user = User.where(params[:email])
    Rails.logger.info("not present")
    Rails.logger.info("ParamsLogin: #{params[:login]}")
    Rails.logger.info("Email: #{params[:email]}")
    Rails.logger.info("Password: #{params[:password]}")

    if params[:login].present?
      if validation.present?
        render "logins/login"
      else
        session[:user_id] = @users[0].id
        # admin = 管理者
        if @users[0].acc_type == "管理者"
          redirect_to "/admin/students"
        else
          redirect_to "/student/books"
        end
      end
      Rails.logger.info("Present")
      Rails.logger.info(params[:login].present?)
    else
      Rails.logger.info("NotPresent")
      Rails.logger.info(params[:login].present?)
    end
  end

  def logout
    session[:user_id] =nil
     redirect_to "/login"
  end
  

  private
  def validation
    inputRoll_no =params[:rollNo]
    inputPassword =params[:password]
    @errorMessage = []
      # Blank Both Email and Password
    if (inputRoll_no.blank? and  inputPassword.blank?)
      @errorMessage << "ロール番号とパスワードを入力してください。"

      # only blank password
    elsif (inputRoll_no.present? and inputPassword.blank?)
      @errorMessage << "パスワードを入力してください。"
      # only blank email
    elsif (inputRoll_no.blank? and  inputPassword.present?)
      @errorMessage << "ロール番号を入力してください。"
      # Present both email and password
    elsif (inputRoll_no.present? and  inputPassword.present?)
      @users = User.where(:roll_no => inputRoll_no)
      if !@users.present?
        @errorMessage << "ユーザが存在しません。"
      else
        if @users[0].password != inputPassword
          @errorMessage << "パスワードが間違っています。"
        end  
      end
    end
    
  end
end
