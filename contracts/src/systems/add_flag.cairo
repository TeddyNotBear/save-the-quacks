#[system]
mod add_flag {
    use dojo::world::Context;
    use minesweeper::components::square::{Square, SquareTrait};
    use traits::Into;

    fn execute(ctx: Context, x: u16, y: u16) -> (u16, u16, bool) {
        let player_id = ctx.origin;
        let mut square: Square =  get! (ctx.world, (player_id, x, y).into(), Square);
        square.add_flag();

        set! (
            ctx.world,
            (player_id, x, y).into(),
            (Square {
                x: x,
                y: y,
                hidden: true,
                mine: false,
                flag: true,
            })
        );

        (x, y, true)
    }
}