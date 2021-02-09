from discord.ext import commands
from utils import notif


class Verification(commands.Cog):
    def __init__(self, bot):
        self.bot = bot

    @commands.command()
    async def verify(self, ctx):
        await notif.SendError(ctx, "Verification System is not yet set!")


def setup(bot):
    bot.add_cog(Verification(bot))
