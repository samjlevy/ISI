%ISI Notes
%Structure of project to look at all intercell ISIs
%Idea from 1/f type distribution of calcium inter-transient intervals, but
%wrong time scale there
%Use Smith lab NLX data, Catherine's collection of data across different
%regions, online Buzsaki (and other data)

makemousesessionlist type structs for
    - Spike file location
    - LFP file location
    - Structure
    - "Class" of data format: NLX, Catherine's stuff, Buzsaki, etc.
    - animal name
    - session info
   
Loading data: 
    - unique scripts by data format class for 
        - spike times: get cells into 1 cell array; maybe save it?
        - LFP: 

LFP:
All need to be restricted within a session, but do all sessions per animal
filter 2-150Hz, power over whole session
            - Maybe: break by band (alpha, beta, theta, gamma (slow/fast))

Spike times ISI:
All need to be restricted within a session, but do all sessions per animal
    - Typical way now: find next spike, don't count if was already used
    - Thresholding: find next spike within axon conduction delay through 0.5/1s
    - Break by band: like thresholding, but by frequency band
        - Easy to then correlate with relative power of each band in LFP
        - Go below axon conduction delay? What does that mean???
    - Next several spikes: would this get anything more? 

By Method, select within large script, run all sessions by method in parfor, save output
Stats: correlation ISIs to LFP

Basic master script structure
for each session:
    check if LFP processed
    if not, load and process LFP
    end        
end

select ISI method
for each session:
    check if ISIs done
    if not, compute ISI by indicated method
    end
end

for each session
    ISI by LFP correlation
end
pool results by region

%also try:
for each region
    pool ISIs and LFPs
end
ISI by LFP correlation

stats