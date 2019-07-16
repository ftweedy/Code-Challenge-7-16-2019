class UsersController < ApplicationController
    def index
    end

    def show
        users = File.read("/Users/francis/Desktop/Passwd_Service/app/etc/passwd.txt").to_json
        render json: users
    end

    def search
        input = []
        if params.has_key?(:name)
            input.push("name")
        end
        if params.has_key?(:uid)
            input.push("uid")
        end
        if params.has_key?(:gid)
            input.push("gid")
        end
        if params.has_key?(:comment)
            input.push("comment")
        end
        if params.has_key?(:home)
            input.push("home")
        end
        if params.has_key?(:shell)
            input.push("shell")
        end

        users = ""
        File.readlines("/Users/francis/Desktop/Passwd_Service/app/etc/passwd.txt").each do |line|
            if (line.length > 5)
                new_line = line
                temp = line.split

                output = []
                input.each do |par|
                    if (par == "name")
                        temp[1] = temp[1].gsub(/[^\/\w\s]/, "")
                        if (temp[1] == params[:name])
                            output.push(true)
                        else
                            output.push(false)
                        end
                    elsif (par == "uid")
                        temp[3] = temp[3].gsub(/[^\/\w\s]/, "")
                        if (temp[3] == params[:uid])
                            output.push(true)
                        else
                            output.push(false)
                        end
                    elsif (par == "gid")
                        temp[5] = temp[5].gsub(/[^\/\w\s]/, "")
                        if (temp[5] == params[:gid])
                            output.push(true)
                        else
                            output.push(false)
                        end
                    elsif (par == "comment")
                        temp[7] = temp[7].gsub(/[^\/\w\s]/, "")
                        if (temp[7] == params[:comment])
                            output.push(true)
                        else
                            output.push(false)
                        end
                    elsif (par == "home")
                        temp[9] = temp[9].gsub(/[^\/\w\s]/, "")
                        if (temp[9] == params[:home])
                            output.push(true)
                        else
                            output.push(false)
                        end
                    elsif (par == "shell")
                        temp[11] = temp[11].gsub(/[^\/\w\s]/, "")
                        if (temp[11] == params[:shell])
                            output.push(true)
                        else
                            output.push(false)
                        end
                    end
                end
                if !output.include?(false)
                    users.concat(new_line)
                end
            end
        end

        result = users.to_json
        render json: result
    end

    def uid_search
        user = "["
        File.readlines("/Users/francis/Desktop/Passwd_Service/app/etc/passwd.txt").each do |line|
            if (line.length > 5)
                temp = line.split
                temp[3] = temp[3].gsub(/[^\/\w\s]/, "")
                if (temp[3] == params[:uid])
                    user.concat(line)
                    break
                end
            end
        end

        user.concat("]")
        if user.length < 5
            user = "404 Not Found"
        end
        result = user.to_json
        render json: result
    end

    def group_search
        user = ""
        group = "["
        File.readlines("/Users/francis/Desktop/Passwd_Service/app/etc/passwd.txt").each do |line|
            if (line.length > 5)
                temp = line.split
                temp[3] = temp[3].gsub(/,/, "")
                if (temp[3] == params[:uid])
                    temp[1] = temp[1].gsub(/[^\/\w\s]/, "")
                    user.concat(temp[1])
                    break
                end
            end
        end

        File.readlines("/Users/francis/Desktop/Passwd_Service/app/etc/groups.txt").each do |line|
            if (line.length > 5)
                temp = line.split
                temp[5] = temp[5].gsub(/[^\/\w\s]/, "")
                if (temp[5].include?(user))
                    group.concat(line)
                end
            end
        end

        if group.length < 5
            group = "404 Not Found"
        end
        puts group
        puts "test"
        result = group.to_json
        render json: result
    end
end
