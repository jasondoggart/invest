class PortfoliosController < ApplicationController

    def new
        @portfolio = Portfolio.new
    end

    def create
        @portfolio = current_user.portfolios.build(portfolio_params)
        if @portfolio.save
            redirect_to current_user, notice: 'Your account was successfully created'
        else
            render :new
        end
    end

    private

        def portfolio_params
            params.require(:portfolio).permit(:name, :description, :account_type)
        end
end
