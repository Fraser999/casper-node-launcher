#!/usr/bin/env bash

# This script is used in the basic `should_run_command_exiting_with_block_execution_error` unit test.  It should be
# removed once we're finished supporting delta upgrades.

ERROR_MESSAGE=$(cat <<END
   0: casper_node::panic_hook
   1: core::ops::function::Fn::call
   2: std::panicking::rust_panic_with_hook
             at /rustc/f76ecd0668fcdb289456cdc72a39ad15467cc454/library/std/src/panicking.rs:595:17
   3: std::panicking::begin_panic_handler::{{closure}}
             at /rustc/f76ecd0668fcdb289456cdc72a39ad15467cc454/library/std/src/panicking.rs:497:13
   4: std::sys_common::backtrace::__rust_end_short_backtrace
             at /rustc/f76ecd0668fcdb289456cdc72a39ad15467cc454/library/std/src/sys_common/backtrace.rs:141:18
   5: rust_begin_unwind
             at /rustc/f76ecd0668fcdb289456cdc72a39ad15467cc454/library/std/src/panicking.rs:493:5
   6: core::panicking::panic_fmt
             at /rustc/f76ecd0668fcdb289456cdc72a39ad15467cc454/library/core/src/panicking.rs:92:14
   7: casper_node::components::linear_chain_sync::LinearChainSync<I>::block_handled
   8: <casper_node::components::linear_chain_sync::LinearChainSync<I> as casper_node::components::Component<REv>>::handle_event
   9: <casper_node::reactor::joiner::Reactor as casper_node::reactor::Reactor>::dispatch_event
  10: casper_node::reactor::Runner<R>::crank::{{closure}}
  11: casper_node::cli::Cli::run::{{closure}}
  12: <core::future::from_generator::GenFuture<T> as core::future::future::Future>::poll
  13: std::thread::local::LocalKey<T>::with
  14: tokio::runtime::enter::Enter::block_on
  15: tokio::runtime::thread_pool::ThreadPool::block_on
  16: tokio::runtime::context::enter
  17: casper_node::main
  18: std::sys_common::backtrace::__rust_begin_short_backtrace
  19: std::rt::lang_start::{{closure}}
  20: core::ops::function::impls::<impl core::ops::function::FnOnce<A> for &F>::call_once
             at /rustc/f76ecd0668fcdb289456cdc72a39ad15467cc454/library/core/src/ops/function.rs:259:13
      std::panicking::try::do_call
             at /rustc/f76ecd0668fcdb289456cdc72a39ad15467cc454/library/std/src/panicking.rs:379:40
      std::panicking::try
             at /rustc/f76ecd0668fcdb289456cdc72a39ad15467cc454/library/std/src/panicking.rs:343:19
      std::panic::catch_unwind
             at /rustc/f76ecd0668fcdb289456cdc72a39ad15467cc454/library/std/src/panic.rs:396:14
      std::rt::lang_start_internal
             at /rustc/f76ecd0668fcdb289456cdc72a39ad15467cc454/library/std/src/rt.rs:51:25
  21: main
  22: __libc_start_main
  23: _start

panicked at 'assertion failed: \`(left == right)\`
  left: \`BlockHeader { parent_hash: BlockHash(8f0329afd498d377cae4c700abec86bc4f2cc22f7006991120f27fa31f346bb0), state_root_hash: 23231a2925f536000ac8d4cff3d0e76173b4064286caabdfca45996ebd50a306, body_hash: 0e5751c026e543b2e8ab2eb06099daa1d1e5df47778f7787faab45cdf12fe3a8, deploy_hashes: [], transfer_hashes: [], random_bit: true, accumulated_seed: 5e815ae1a11ac5d3a74817c226ca75c0d3d76318394ff4bc899c96465c321389, era_end: None, timestamp: Timestamp(1614205497344), era_id: EraId(2), height: 22, proposer: PublicKey::Ed25519(5cadb791accdf6deadd9664866590adcc053f13589298e4a1590f917d40973b1), next_era_validator_weights: None }\`,
 right: \`BlockHeader { parent_hash: BlockHash(8f0329afd498d377cae4c700abec86bc4f2cc22f7006991120f27fa31f346bb0), state_root_hash: 0c9b503dc58d12622d03b90507eeffbe45f53370a16316dfe97f0b2ac74cac3b, body_hash: 0e5751c026e543b2e8ab2eb06099daa1d1e5df47778f7787faab45cdf12fe3a8, deploy_hashes: [], transfer_hashes: [], random_bit: true, accumulated_seed: 5e815ae1a11ac5d3a74817c226ca75c0d3d76318394ff4bc899c96465c321389, era_end: None, timestamp: Timestamp(1614205497344), era_id: EraId(2), height: 22, proposer: PublicKey::Ed25519(5cadb791accdf6deadd9664866590adcc053f13589298e4a1590f917d40973b1), next_era_validator_weights: None }\`: Block execution result doesn't match received block.', node/src/components/linear_chain_sync.rs:161:39
Error: "casper-node/utils/nctl/assets/net-1/nodes/node-8/bin/1_0_0/casper-node" "validator" "casper-node/utils/nctl/assets/net-1/nodes/node-8/config/1_0_0/config.toml" exited with error
END
)

>&2 echo "${ERROR_MESSAGE}"
exit 101
