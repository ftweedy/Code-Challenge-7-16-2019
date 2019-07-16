class GroupsController < ApplicationController
    def show
        groups = File.read("/Users/francis/Desktop/Passwd_Service/app/etc/groups.txt").to_json
        render json: groups
    end

    def search
        input = []
        members_input = []
        if params.has_key?(:name)
            input.push("name")
        end
        if params.has_key?(:gid)
            input.push("gid")
        end
        if params.has_key?(:member)
            input.push("member")
            members = params[:member].gsub(/,/, "")
            members_input = members.split
        end

        groups = ""
        File.readlines("/Users/francis/Desktop/Passwd_Service/app/etc/groups.txt").each do |line|
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
                    elsif (par == "gid")
                        temp[3] = temp[3].gsub(/[^\/\w\s]/, "")
                        if (temp[3] == params[:gid])
                            output.push(true)
                        else
                            output.push(false)
                        end
                    elsif (par == "member")
                        temp[5] = temp[5].gsub(/,/, " ")
                        membs = temp[5].split
                        puts membs

                        members_input.each do |i|
                            membs.each do |mem|
                                mem = mem.gsub(/[^\/\w\s]/, "")
                                puts mem

                                if (i == mem)
                                    output.push(true)
                                    break
                                end
                            end
                        end
                    end
                end
                if !output.include?(false) && output.include?(true)
                    groups.concat(new_line)
                end
            end
        end

        result = groups.to_json
        render json: result
    end

    def gid_search
        group = "["
        File.readlines("/Users/francis/Desktop/Passwd_Service/app/etc/groups.txt").each do |line|
            if (line.length > 5)
                temp = line.split
                temp[3] = temp[3].gsub(/[^\/\w\s]/, "")
                if (temp[3] == params[:gid])
                    group.concat(line)
                    break
                end
            end
        end

        group.concat("]")
        if group.length < 5
            group = "404 Not Found"
        end
        result = group.to_json
        render json: result
    end
end
