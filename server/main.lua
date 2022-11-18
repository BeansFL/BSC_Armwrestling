local sessions = {}

Citizen.CreateThread(function()
    local template = {place1 = 0, place2 = 0, started = false, grade = 0.5}
    for i, _ in pairs(globalConfig.props) do
        table.insert(sessions, template)
    end
end)
  

RegisterNetEvent('bsc_arm:check_sv')
AddEventHandler('bsc_arm:check_sv', function(position)
    local a, b, c = table.unpack(position)
    for i, props in pairs(globalConfig.props) do
        local x = a - props.x
        local y = b - props.y
        local z = c - props.z

        if #vec3(x, y, z) < 1.5 then
            if sessions[i].place1 == 0 and not sessions[i].started then
                sessions[i].place1 = source
                TriggerClientEvent('bsc_arm:check_cl', source, 'place1')
            elseif sessions[i].place2 == 0 and sessions[i].place1 ~= 0 then
                sessions[i].place2 = source
                TriggerClientEvent('bsc_arm:check_cl', source, 'place2')
            else
                TriggerClientEvent('bsc_arm:check_cl', source, 'noplace')
                return
            end

            if sessions[i].place1 ~= 0 and sessions[i].place2 ~= 0 and not sessions[i].started then
                TriggerClientEvent('bsc_arm:start_cl', sessions[i].place1)
                TriggerClientEvent('bsc_arm:start_cl', sessions[i].place2)
                break
            end

        end
    end
    

end)


RegisterNetEvent('bsc_arm:updategrade_sv')
AddEventHandler('bsc_arm:updategrade_sv', function(gradeUpValue)

    for i, props in pairs(sessions) do

        if props.place1 == source or props.place2 == source then
            props.grade = props.grade + gradeUpValue
            if props.grade <= 0.10 then
                props.grade = -999
            elseif props.grade >= 0.90 then
                props.grade = 999
            end
            
            TriggerClientEvent('bsc_arm:updategrade_cl', props.place1, props.grade)
            TriggerClientEvent('bsc_arm:updategrade_cl', props.place2, props.grade)
            break
        end

    end

end)

RegisterNetEvent('bsc_arm:disband_sv')
AddEventHandler('bsc_arm:disband_sv', function(position)
    local a, b, c = table.unpack(position)
   
    for i, props in pairs(globalConfig.props) do
        local x = a - props.x
        local y = b - props.y
        local z = c - props.z
        local _source = source
        if #vec3(x, y, z) < 1.5 then
            if sessions[i].place1 == source or sessions[i].place2 == source then
                local k = i
                if sessions[i].place1 ~= 0 then
                    TriggerClientEvent('bsc_arm:reset_cl', sessions[k].place1)
                end
                if sessions[i].place2 ~= 0 then
                    TriggerClientEvent('bsc_arm:reset_cl', sessions[i].place2)
                end
                Wait(100)
                sessions[i].started = false
                sessions[i].place1 = 0
                sessions[i].place2 = 0
                sessions[i].grade = 0.5        
                break
            end

        end
    end

end)

function resetSession(i)
    sessions[i] = {place1 = 0, place2 = 0, started = false, grade = 0.5}
end


