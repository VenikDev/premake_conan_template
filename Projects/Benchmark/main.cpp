#include <benchmark/benchmark.h>

#include <memory>

static void BM_StringCopy(benchmark::State& state) {
   std::string x = "hello, hello, hello, hello, hello, hello";
   for (auto _ : state) {
      std::string copy(x);
   }
}

BENCHMARK(BM_StringCopy);

static void BM_VectorFill(benchmark::State& state) {
   const int32_t size = state.range(0);

   for (auto _ : state) {
      _STD vector<int32_t> vec;
      vec.reserve(size);

      for (int i = 0; i < size; ++i) {
         vec.push_back(i);
      }
   }

   state.SetComplexityN(state.range(0));
}

BENCHMARK(BM_VectorFill)
    ->RangeMultiplier(2)
    ->Range(8, 8 << 5)
    ->Complexity(benchmark::oN);

static void BM_memcpy(benchmark::State& state) {
   auto src = std::make_unique<int8_t[]>(state.range(0));
   auto dst = std::make_unique<int8_t[]>(state.range(0));

   memset(src.get(), 'x', state.range(0));

   for (auto _ : state) {
      memcpy(dst.get(), src.get(), state.range(0));
   }
   state.SetBytesProcessed(state.iterations() * state.range(0));
}

static void MakeMemcpyArgs(benchmark::internal::Benchmark* b) {
   for (int i = 1; i <= 10; i += 2) {
      for (int j = 32; j <= 1024 * 1024; j *= 8) {
         b->Arg(i * j);
      }
   }
}

BENCHMARK(BM_memcpy)->Apply(MakeMemcpyArgs);

BENCHMARK_MAIN();