class PortfoliosController < ApplicationController

    def new
        @portfolio = Portfolio.new
    end

    def create
        @portfolio = current_user.portfolios.build(portfolio_params)
        if @portfolio.save
            redirect_to current_user, notice: 'Your portfolio was successfully created'
        else
            render :new
        end
    end

    def edit
        @portfolio = Portfolio.find(params[:id])
    end

    def update
        @portfolio = Portfolio.find(params[:id])
        if @portfolio.update(portfolio_params)
            redirect_to current_user, notice: 'Your portfolio was successfully created'
        else
            render :edit
        end
    end

    private

        def portfolio_params
            params.require(:portfolio).permit(:name, :description, :account_type)
        end
end
