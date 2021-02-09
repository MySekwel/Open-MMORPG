import os

from discord.ext import commands

from utils import settings

bot = commands.Bot(command_prefix="!", help_command=None, case_insensitive=True)

for file in os.listdir("cogs"):
    if file.endswith(".py"):
        bot.load_extension(f"cogs.{file[:-3]}")


bot.run(settings.TOKEN)
