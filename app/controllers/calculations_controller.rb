class CalculationsController < ApplicationController
    def index
        year = params[:year]&.to_i || Date.today.year
        month = params[:month]&.to_i || Date.today.month
        date = Date.new(year, month, 1)
        @display_year = year
        @display_month = month
        range = date.beginning_of_month..date.end_of_month
        @calculations = Calculation.where(date: range)
        @total_income = @calculations.where(calculation_type: 'income').sum(:amount)
        @total_expense = @calculations.where(calculation_type: 'expense').sum(:amount)
        @balance = @total_income - @total_expense
    end
  
    def new
        @calculation = Calculation.new
    end

    def create
        @calculation = Calculation.new(calculation_params)
        if @calculation.save
            redirect_to calculations_path, notice: "登録が完了しました"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @calculation = Calculation.find(params[:id])
    end

    def update
        @calculation = Calculation.find(params[:id])
        if @calculation.update(calculation_params)
            redirect_to calculations_path, notice: "更新しました"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @calculation = Calculation.find(params[:id])
        @calculation.destroy
        redirect_to calculations_path, notice: "削除しました"
    end

    private
    def calculation_params
        params.require(:calculation).permit(:date, :amount, :calculation_type, :category_id, :note)
    end
end






