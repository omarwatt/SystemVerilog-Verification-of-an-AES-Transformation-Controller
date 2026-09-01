# External Standard-Cell Models

Gate-netlist compilation requires the `slow.v` Verilog cell models supplied in the original Part 3 archive. Its header identifies proprietary Artisan Components/TSMC material, subject to the applicable license agreement. It is not redistributed in this GitHub-oriented package.

If your license permits local use, provide the model through either location:

- Copy your existing file to `vendor/slow.v` locally. This path is ignored by Git.
- Set `ARTISAN_SLOW_MODEL` to the absolute path of your existing file before starting ModelSim/Questa.

The RTL simulations do not require this model. `scripts/compile_gate.do` checks for it before compiling the mapped netlist. Keep its original copyright and license notices.
