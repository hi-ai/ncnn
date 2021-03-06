// Tencent is pleased to support the open source community by making ncnn available.
//
// Copyright (C) 2020 THL A29 Limited, a Tencent company. All rights reserved.
//
// Licensed under the BSD 3-Clause License (the "License"); you may not use this file except
// in compliance with the License. You may obtain a copy of the License at
//
// https://opensource.org/licenses/BSD-3-Clause
//
// Unless required by applicable law or agreed to in writing, software distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

#ifndef NCNN_OPS_TD
#define NCNN_OPS_TD

include "mlir/IR/OpBase.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

def NCNN_Dialect : Dialect {
  let name = "ncnn";
  let cppNamespace = "ncnn";
}

//===----------------------------------------------------------------------===//
// NCNN op definitions
//===----------------------------------------------------------------------===//

class NCNN_Op<string mnemonic, list<OpTrait> traits = []> :
    Op<NCNN_Dialect, mnemonic, traits>;

//===----------------------------------------------------------------------===//
// NCNN operations
//===----------------------------------------------------------------------===//

def NCNN_InstanceNormOp : NCNN_Op<"InstanceNorm", [NoSideEffect]> {

  let arguments = (ins
    F32Tensor:$x,
    F32Tensor:$gamma,
    F32Tensor:$beta,
    F32Attr:$epsilon
  );

  let results = (outs
    F32Tensor:$y
  );

  let hasCanonicalizer = 1;
}

#endif // NCNN_OPS_TD
