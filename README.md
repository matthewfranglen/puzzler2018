# Vim Submission for Puzzler 2018

This submission uses vim _macros_ to implement a bot.
The bot is implemented in `yourBot.vim`.

You can run it with `make run-your-bot`.

It does not use the best algorithm.
It can get stuck.

## Structure

The script launches vim using the default settings, instructing it to load and execute the first line of the second paragraph as a macro.
This macro then loads other macros into named registers and then invokes them.

## Important Change

To achieve this the server needs to accept GET requests for all used endpoints.
The main endpoint for the bot also requires a payload.

To permit this *the server implementation was changed*:
 * All routes accept GET requests.
 * The payload of the tick request can be provided as a json argument.

## Reviewing

The macros use unprintable characters that may be corrupted when viewed.
It would be best to open `yourBot.vim` in vim as it will display the code properly.

See https://github.com/smmathews-bw-boston/puzzler2018 for original README
