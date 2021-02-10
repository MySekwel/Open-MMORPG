from discord.ext import commands

from core import user
from utils import getter, notif


class GeneralCommands(commands.Cog):
    def __init__(self, bot):
        self.bot = bot

    @commands.group(invoke_without_command=True)
    async def get(self):
        print('Test')

    @get.command()
    async def ip(self, ctx, name):
        if not user.Registered(name):
            await notif.SendError(ctx, 'Cannot find user from the database!', tip='Make sure the name is correct.')
            return
        user_id = getter.GetUIDFromUserName(name)
        ip = getter.GetIPFromUserUID(user_id)
        await ctx.send(f'The **IP Address** of the name `{name}` is `{ip}`.')

    @commands.command()
    async def help(self, ctx):
        await ctx.author.send('HEEEEEEEEEEEEEEEELP!')


def setup(bot):
    bot.add_cog(GeneralCommands(bot))
