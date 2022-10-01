# RandomCode
Some very messy random code that might be helpful

RemoveSingletons.R - This code replaces all phylogenetically uninformative sites with a default N or whatever you want (e.g. - or ?). This is potentially useful with checking the output of UCE alignments with toepads. Toepad alignments seem to have extra erroneous SNPs that cause long branches. The code takes a phylip as an input and outputs a CSV that you will have to manually put back into a phylip format. If you replace all commas with enters and remove all quotes, you're halfway there. Then all sequence data are in the same order and you just have to put a tab between your labels and your sequences.
