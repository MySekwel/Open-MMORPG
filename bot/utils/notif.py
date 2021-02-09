from discord import Embed, Colour


async def SendError(ctx, error, color=Colour.red(), tip="!help to see the list of commands."):
    embed = Embed(
        title='An Error has occurred',
        description=f'**Error:** `{error}`',
        colour=color
    )
    embed.set_footer(text=f'Tip: {tip}')
    await ctx.send(embed=embed)


async def SendErrorAsDM(ctx, error, color=Colour.red(), tip="!help to see the list of commands."):
    embed = Embed(
        title='An Error has occurred',
        description=f'**Error:** `{error}`',
        colour=color
    )
    embed.set_footer(text=f'Tip: {tip}')
    await ctx.author.send(embed=embed)


async def SendWarning(ctx, warning, color=Colour.orange(), tip="!help to see the list of commands."):
    embed = Embed(
        title='Warning Notification',
        description=f'**Warning:** `{warning}`',
        colour=color
    )
    embed.set_footer(text=f'Tip: {tip}')
    await ctx.send(embed=embed)


async def SendWarningAsDM(ctx, warning, color=Colour.orange(), tip="!help to see the list of commands."):
    embed = Embed(
        title='Warning Notification',
        description=f'**Warning:** `{warning}`',
        colour=color
    )
    embed.set_footer(text=f'Tip: {tip}')
    await ctx.author.send(embed=embed)


async def SendTip(ctx, tip, color=Colour.orange(), tipper="Who knows ¯\_(ツ)_/¯"):
    embed = Embed(
        title='A Tip Has Arrived!',
        description=f'**Tip:** `{tip}`',
        colour=color
    )
    embed.set_footer(text=f'From: {tipper}')
    await ctx.send(embed=embed)
