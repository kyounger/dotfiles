function toggle_audio_output()
    -- Define audio device names for headphone/speaker switching

    local current =            hs.audiodevice.defaultOutputDevice()
    local macbookProSpeakers = hs.audiodevice.findOutputByName("MacBook Pro Speakers")
    local externalHeadphones = hs.audiodevice.findOutputByName("External Headphones")
    local yetiOutput =         hs.audiodevice.findOutputByName("Yeti Stereo Microphone")
    local desktopSpeakers =    hs.audiodevice.findOutputByName("DisplayPort")

    -- print(current:name())
    -- print(desktopSpeakers:name())
    -- print(yetiOutput:name())

    if not desktopSpeakers or not yetiOutput then
        hs.notify.new({title="Hammerspoon", informativeText="ERROR: Some audio devices are missing.", ""}):send()
        return
    end

    if current:name() == desktopSpeakers:name() then
        yetiOutput:setDefaultOutputDevice()
    else
        desktopSpeakers:setDefaultOutputDevice()
    end
    hs.notify.new({
          title='Hammerspoon',
            informativeText='Default output device: '..hs.audiodevice.defaultOutputDevice():name()
        }):send()
end

return toggle_audio_output
