class TicTacToe
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [0,4,8],
        [1,4,7],
        [2,4,6],
        [2,4,8]
    ]
    def display_board
        puts @board
    end
    def input_to_index(input)
        input.to_i - 1
    end
    def move(index, token = "X")
        @board[index] = token
    end
    def position_taken?(index)
        if @board[index] == ""
            return false
        else
            return true
        end
    end
    def valid_move?(position)
        if position <= 8 && position >= 0
            return position_taken?(position)
        else
            return false
        end
    end
    def turn_count
        @board.count { |x| x != " " }
    end
    def current_player
        if turn_count.even?
            return "X"
        else
            return "O"
        end
    end
    def turn
        gets input
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
    end
    # def won?
    #     WIN_COMBINATIONS.each do |combo|
    #         position_taken?[combo[0]] && [@board[combo[0],@board[combo[1],@board[combo[2]]]]].uniq.length == 1
    #         return true
    #     else
    #         return false
    #     end
    # end
    # end
    def won?
        WIN_COMBINATIONS.each{ |combo| 
            if position_taken?[combo[0]] && [@board[combo[0],@board[combo[1],@board[combo[2]]]]].uniq.length == 1
                return true
            else
                return false
            end
            }
        end
    end
    def full?
        @board.each do |pos| 
            if turn_count >= 9
                return true
            else
                return false
            end 
        end
    end
    def draw?
        if full?
            if won?
                return false
            else
                return true
            end
        else
            return false
        end
    end
    def over?
        won? || full?
    end
end